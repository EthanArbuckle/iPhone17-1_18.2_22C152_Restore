@interface PLTaggedPointer
+ (BOOL)taggedPointersEnabled;
+ (id)newInstanceWithPayload:(unint64_t)a3;
+ (id)newInstanceWithSignedPayload:(int64_t)a3;
+ (unsigned)tag;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTaggedPointer;
- (PLTaggedPointer)initWithPayload:(unint64_t)a3;
- (PLTaggedPointer)initWithSignedPayload:(int64_t)a3;
- (int64_t)signedPayload;
- (unint64_t)payload;
@end

@implementation PLTaggedPointer

+ (id)newInstanceWithPayload:(unint64_t)a3
{
  unsigned int v5 = [a1 tag];
  if (v5)
  {
    if (v5 > 6) {
      unint64_t v6 = (((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | ((unint64_t)v5 << 55)) + 0x7C00000000000000) | 0x8000000000000007;
    }
    else {
      unint64_t v6 = v5 | (8 * a3) | 0x8000000000000000;
    }
    unint64_t v7 = *MEMORY[0x1E4FBA8E0] ^ v6;
    if ((~v7 & 0xC000000000000007) != 0) {
      unint64_t v6 = v7 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v7 & 7));
    }
    id v8 = (id)v6;
    if ([v8 payload] == a3)
    {
      if (v6) {
        return v8;
      }
    }
    else
    {
    }
  }
  id v10 = objc_alloc((Class)a1);
  return (id)[v10 initWithPayload:a3];
}

- (unint64_t)payload
{
  if (((unint64_t)self & 0x8000000000000000) == 0 || !*MEMORY[0x1E4FBA8D8]) {
    return self->_payload.unsignedPayload;
  }
  uint64_t v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v2 = 0;
  }
  unint64_t v3 = v2 ^ (unint64_t)self;
  uint64_t v4 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v3 & 7) == 0) {
    uint64_t v4 = 0xFFFFFFFFFFFFFLL;
  }
  return v4 & (v3 >> 3);
}

uint64_t __22__PLTaggedPointer_tag__block_invoke(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 32);
}

+ (unsigned)tag
{
  if (!*MEMORY[0x1E4FBA8D8]) {
    goto LABEL_8;
  }
  unint64_t v3 = objc_opt_class();
  objc_sync_enter(v3);
  if (PFObjc_implementsClassMethod())
  {
    LOWORD(v4) = [a1 tag];
    objc_sync_exit(v3);

    return v4;
  }
  int v4 = (unsigned __int16)nextTag;
  if ((unsigned __int16)nextTag > 0xBu)
  {
    int v4 = 0;
  }
  else
  {
    _objc_registerTaggedPointerClass();
    ++nextTag;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __22__PLTaggedPointer_tag__block_invoke;
  v11[3] = &__block_descriptor_34_e8_S16__0_8l;
  __int16 v12 = v4;
  unsigned int v5 = (void *)MEMORY[0x19F38F770](v11);
  Class = object_getClass(a1);
  unint64_t v7 = (void *)MEMORY[0x19F38F770](v5);
  id v8 = imp_implementationWithBlock(v7);
  class_addMethod(Class, "tag", v8, 0);

  objc_sync_exit(v3);
  if (!v4)
  {
LABEL_8:
    id v10 = NSStringFromClass((Class)a1);
    _PFAssertContinueHandler();

    LOWORD(v4) = 0;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    unint64_t v7 = [(PLTaggedPointer *)self payload];
    BOOL v6 = v7 == [v4 payload];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isTaggedPointer
{
  return (uint64_t)self < 0 && *MEMORY[0x1E4FBA8D8] != 0;
}

- (int64_t)signedPayload
{
  if (((unint64_t)self & 0x8000000000000000) == 0 || !*MEMORY[0x1E4FBA8D8]) {
    return self->_payload.signedPayload;
  }
  uint64_t v2 = *MEMORY[0x1E4FBA8E0];
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v2 = 0;
  }
  unint64_t v3 = v2 ^ (unint64_t)self;
  char v4 = ~(_BYTE)v3;
  int64_t v5 = (uint64_t)(v3 << 9) >> 12;
  int64_t v6 = (uint64_t)(2 * v3) >> 4;
  if ((v4 & 7) != 0) {
    return v6;
  }
  else {
    return v5;
  }
}

- (PLTaggedPointer)initWithSignedPayload:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLTaggedPointer;
  result = [(PLTaggedPointer *)&v5 init];
  if (result) {
    result->_payload.unsignedPayload = a3;
  }
  return result;
}

- (PLTaggedPointer)initWithPayload:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLTaggedPointer;
  result = [(PLTaggedPointer *)&v5 init];
  if (result) {
    result->_payload.unsignedPayload = a3;
  }
  return result;
}

+ (id)newInstanceWithSignedPayload:(int64_t)a3
{
  unsigned int v5 = [a1 tag];
  if (v5)
  {
    if (v5 > 6) {
      unint64_t v6 = (((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | ((unint64_t)v5 << 55)) + 0x7C00000000000000) | 0x8000000000000007;
    }
    else {
      unint64_t v6 = v5 | (unint64_t)(8 * a3) | 0x8000000000000000;
    }
    unint64_t v7 = *MEMORY[0x1E4FBA8E0] ^ v6;
    if ((~v7 & 0xC000000000000007) != 0) {
      unint64_t v6 = v7 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v7 & 7));
    }
    id v8 = (id)v6;
    if ([v8 signedPayload] == a3)
    {
      if (v6) {
        return v8;
      }
    }
    else
    {
    }
  }
  id v10 = objc_alloc((Class)a1);
  return (id)[v10 initWithPayload:a3];
}

+ (BOOL)taggedPointersEnabled
{
  return *MEMORY[0x1E4FBA8D8] != 0;
}

@end