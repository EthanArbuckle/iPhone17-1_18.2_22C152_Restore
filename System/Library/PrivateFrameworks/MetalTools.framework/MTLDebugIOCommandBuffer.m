@interface MTLDebugIOCommandBuffer
- (void)addCompletedHandler:(id)a3;
- (void)commit;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)internalValidateEvent:(id)a3;
- (void)internalValidateLoadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7;
- (void)internalValidateLoadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6;
- (void)internalValidateLoadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11;
- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 handle:(id)a6 handleOffset:(unint64_t)a7;
- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7;
- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11;
- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11;
- (void)signalEvent:(id)a3 value:(unint64_t)a4;
- (void)tryCancel;
- (void)waitForEvent:(id)a3 value:(unint64_t)a4;
@end

@implementation MTLDebugIOCommandBuffer

- (void)internalValidateEvent:(id)a3
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (!a3) {
    goto LABEL_7;
  }
  if (([a3 conformsToProtocol:&unk_26EF97D50] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a3 conformsToProtocol:&unk_26EF97D50])
  {
    uint64_t v5 = *(void *)&self->MTLToolsIOCommandBuffer_opaque[24];
    if (v5 != [a3 device]) {
LABEL_7:
    }
      _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (void)addCompletedHandler:(id)a3
{
  if (!a3) {
    MTLReportFailure();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v5 addCompletedHandler:a3];
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  -[MTLDebugIOCommandBuffer internalValidateEvent:](self, "internalValidateEvent:");
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v7 encodeWaitForEvent:a3 value:a4];
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  -[MTLDebugIOCommandBuffer internalValidateEvent:](self, "internalValidateEvent:");
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v7 encodeSignalEvent:a3 value:a4];
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  -[MTLDebugIOCommandBuffer internalValidateEvent:](self, "internalValidateEvent:");
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v7 encodeWaitForEvent:a3 value:a4];
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  -[MTLDebugIOCommandBuffer internalValidateEvent:](self, "internalValidateEvent:");
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v7 encodeSignalEvent:a3 value:a4];
}

- (void)internalValidateLoadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a3)
  {
    if (([a3 conformsToProtocol:&unk_26EF82558] & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (![a3 conformsToProtocol:&unk_26EF82558]
      || (uint64_t v13 = *(void *)&self->MTLToolsIOCommandBuffer_opaque[24], v13 == [a3 device]))
    {
      if (a6) {
        goto LABEL_7;
      }
LABEL_22:
      _MTLMessageContextPush_();
      goto LABEL_11;
    }
  }
  _MTLMessageContextPush_();
  if (!a6) {
    goto LABEL_22;
  }
LABEL_7:
  if (([a6 conformsToProtocol:&unk_26EFA26F0] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a6 conformsToProtocol:&unk_26EFA26F0])
  {
    uint64_t v14 = *(void *)&self->MTLToolsIOCommandBuffer_opaque[24];
    if (v14 != [a6 device]) {
      goto LABEL_22;
    }
  }
LABEL_11:
  unint64_t v15 = a5 + a4;
  if (v15 > objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length"))
  {
    unint64_t v16 = v15;
    uint64_t v18 = objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length");
    _MTLMessageContextPush_();
    if (a5) {
      goto LABEL_13;
    }
  }
  else if (a5)
  {
    goto LABEL_13;
  }
  unint64_t v16 = 0;
  _MTLMessageContextPush_();
LABEL_13:
  if (objc_msgSend((id)objc_msgSend(a6, "baseObject", v16, v18), "length") < a7)
  {
    unint64_t v17 = a7;
    uint64_t v19 = objc_msgSend((id)objc_msgSend(a6, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  if (a7 + a5 > objc_msgSend((id)objc_msgSend(a6, "baseObject", v17, v19), "length"))
  {
    objc_msgSend((id)objc_msgSend(a6, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (void)internalValidateLoadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a3)
  {
    if (!a5) {
      goto LABEL_14;
    }
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a5) {
      goto LABEL_14;
    }
  }
  if (([a5 conformsToProtocol:&unk_26EFA26F0] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a5 conformsToProtocol:&unk_26EFA26F0])
  {
    uint64_t v11 = *(void *)&self->MTLToolsIOCommandBuffer_opaque[24];
    if (v11 != [a5 device])
    {
LABEL_14:
      _MTLMessageContextPush_();
      if (a4) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  if (a4) {
    goto LABEL_8;
  }
LABEL_15:
  uint64_t v12 = 0;
  _MTLMessageContextPush_();
LABEL_8:
  if (objc_msgSend((id)objc_msgSend(a5, "baseObject", v12), "length") < a6)
  {
    unint64_t v13 = a6;
    uint64_t v14 = objc_msgSend((id)objc_msgSend(a5, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  if (a6 + a4 > objc_msgSend((id)objc_msgSend(a5, "baseObject", v13, v14), "length"))
  {
    objc_msgSend((id)objc_msgSend(a5, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  -[MTLDebugIOCommandBuffer internalValidateLoadBytes:size:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadBytes:size:sourceHandle:sourceHandleOffset:");
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v11 loadBytes:a3 size:a4 sourceHandle:a5 sourceHandleOffset:a6];
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 handle:(id)a6 handleOffset:(unint64_t)a7
{
  -[MTLDebugIOCommandBuffer internalValidateLoadBuffer:offset:size:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadBuffer:offset:size:sourceHandle:sourceHandleOffset:");
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v13 loadBuffer:a3 offset:a4 size:a5 sourceHandle:a6 sourceHandleOffset:a7];
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  -[MTLDebugIOCommandBuffer internalValidateLoadBuffer:offset:size:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadBuffer:offset:size:sourceHandle:sourceHandleOffset:");
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v13 loadBuffer:a3 offset:a4 size:a5 sourceHandle:a6 sourceHandleOffset:a7];
}

- (void)internalValidateLoadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (a3)
  {
    if (([a3 conformsToProtocol:&unk_26EF9C6F8] & 1) == 0) {
      _MTLMessageContextPush_();
    }
    if (![a3 conformsToProtocol:&unk_26EF9C6F8]
      || (uint64_t v16 = *(void *)&self->MTLToolsIOCommandBuffer_opaque[24], v16 == [a3 device]))
    {
      if (a10) {
        goto LABEL_7;
      }
LABEL_55:
      _MTLMessageContextPush_();
      goto LABEL_13;
    }
  }
  _MTLMessageContextPush_();
  if (!a10) {
    goto LABEL_55;
  }
LABEL_7:
  if (([a10 conformsToProtocol:&unk_26EFA26F0] & 1) == 0) {
    _MTLMessageContextPush_();
  }
  if ([a10 conformsToProtocol:&unk_26EFA26F0])
  {
    uint64_t v17 = *(void *)&self->MTLToolsIOCommandBuffer_opaque[24];
    if (v17 != [a10 device]) {
      _MTLMessageContextPush_();
    }
    if ([a3 storageMode] == 3) {
      goto LABEL_55;
    }
  }
LABEL_13:
  if (!(a6->var1 * a6->var0 * a6->var2))
  {
    unint64_t var2 = a6->var2;
    uint64_t v35 = 0;
    unint64_t var0 = a6->var0;
    unint64_t var1 = a6->var1;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend((id)objc_msgSend(a10, "baseObject", var0, var1, var2, v35), "length") < a11)
  {
    unint64_t v24 = a11;
    uint64_t v29 = objc_msgSend((id)objc_msgSend(a10, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "isFramebufferOnly", v24, v29)) {
    _MTLMessageContextPush_();
  }
  if ([a3 mipmapLevelCount] <= a5)
  {
    unint64_t v25 = a5;
    uint64_t v30 = [a3 mipmapLevelCount];
    _MTLMessageContextPush_();
  }
  uint64_t v18 = objc_msgSend(a3, "numFaces", v25, v30);
  if ([a3 arrayLength] * v18 <= a4)
  {
    uint64_t v22 = [a3 numFaces];
    unint64_t v26 = a4;
    uint64_t v31 = [a3 arrayLength] * v22;
    _MTLMessageContextPush_();
  }
  uint64_t v19 = (uint64_t *)((char *)a3 + 72);
  objc_msgSend(a3, "pixelFormat", v26, v31);
  [a3 width];
  [a3 height];
  [a3 depth];
  [a3 sampleCount];
  MTLGetTextureLevelInfoForDevice();
  _MTLAdjustMTLSize();
  unint64_t v20 = a9->var0;
  if ((*((unsigned char *)a3 + 81) & 4) != 0)
  {
    if (v20)
    {
      unint64_t v27 = a9->var0;
      uint64_t v32 = 0;
      _MTLMessageContextPush_();
    }
    if (a9->var1)
    {
      unint64_t v27 = a9->var1;
      uint64_t v32 = 0;
      _MTLMessageContextPush_();
    }
    if (a9->var2)
    {
      unint64_t v27 = a9->var2;
      uint64_t v32 = 0;
      goto LABEL_57;
    }
  }
  else
  {
    unint64_t v21 = a6->var0 + v20;
    if (v21)
    {
      unint64_t v27 = v21;
      uint64_t v32 = 0;
      _MTLMessageContextPush_();
    }
    if (a6->var1 + a9->var1)
    {
      unint64_t v27 = a6->var1 + a9->var1;
      uint64_t v32 = 0;
      _MTLMessageContextPush_();
    }
    if (a6->var2 + a9->var2)
    {
      unint64_t v27 = a6->var2 + a9->var2;
      uint64_t v32 = 0;
LABEL_57:
      _MTLMessageContextPush_();
    }
  }
  if ((*((unsigned char *)a3 + 81) & 4) != 0)
  {
    if (a9->var0 % *((void *)a3 + 13))
    {
      uint64_t v32 = *v19;
      uint64_t v34 = *((void *)a3 + 13);
      unint64_t v27 = a9->var0;
      _MTLMessageContextPush_();
    }
    if (a9->var1 % *((void *)a3 + 14))
    {
      uint64_t v32 = *v19;
      uint64_t v34 = *((void *)a3 + 14);
      unint64_t v27 = a9->var1;
      _MTLMessageContextPush_();
    }
    if (a9->var2 % *((void *)a3 + 15))
    {
      uint64_t v32 = *v19;
      uint64_t v34 = *((void *)a3 + 15);
      unint64_t v27 = a9->var2;
      _MTLMessageContextPush_();
    }
    if (0uLL % *((void *)a3 + 13))
    {
      uint64_t v32 = *v19;
      uint64_t v34 = *((void *)a3 + 13);
      unint64_t v27 = 0;
      _MTLMessageContextPush_();
    }
    if (0uLL % *((void *)a3 + 14))
    {
      uint64_t v32 = *v19;
      uint64_t v34 = *((void *)a3 + 14);
      unint64_t v27 = 0;
      _MTLMessageContextPush_();
    }
    if (0uLL % *((void *)a3 + 15))
    {
      uint64_t v32 = *v19;
      uint64_t v34 = *((void *)a3 + 15);
      unint64_t v27 = 0;
      _MTLMessageContextPush_();
    }
  }
  if ((*((unsigned char *)a3 + 81) & 4) != 0)
  {
    if (*((void *)a3 + 15) != 1) {
      _MTLMessageContextPush_();
    }
    if (objc_msgSend(a3, "textureType", v27, v32, v34) == 9) {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a9;
  -[MTLDebugIOCommandBuffer internalValidateLoadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", a3, a4, a5, &v22, &v21, a10, a11);
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19 = *a9;
  v18.receiver = self;
  v18.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v18 loadTexture:a3 slice:a4 level:a5 size:&v20 sourceBytesPerRow:a7 sourceBytesPerImage:a8 destinationOrigin:&v19 sourceHandle:a10 sourceHandleOffset:a11];
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a9;
  -[MTLDebugIOCommandBuffer internalValidateLoadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", a3, a4, a5, &v22, &v21, a10, a11);
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19 = *a9;
  v18.receiver = self;
  v18.super_class = (Class)MTLDebugIOCommandBuffer;
  [(MTLToolsIOCommandBuffer *)&v18 loadTexture:a3 slice:a4 level:a5 size:&v20 sourceBytesPerRow:a7 sourceBytesPerImage:a8 destinationOrigin:&v19 sourceHandle:a10 sourceHandleOffset:a11];
}

- (void)commit
{
  uint64_t v4 = 0;
  memset(&v3[1], 0, 48);
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isCommitted")) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v3[0].receiver = self;
  v3[0].super_class = (Class)MTLDebugIOCommandBuffer;
  [(objc_super *)v3 commit];
}

- (void)tryCancel
{
  uint64_t v4 = 0;
  memset(&v3[1], 0, 48);
  [(MTLToolsObject *)self device];
  _MTLMessageContextBegin_();
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isCommitted") & 1) == 0) {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v3[0].receiver = self;
  v3[0].super_class = (Class)MTLDebugIOCommandBuffer;
  [(objc_super *)v3 tryCancel];
}

@end