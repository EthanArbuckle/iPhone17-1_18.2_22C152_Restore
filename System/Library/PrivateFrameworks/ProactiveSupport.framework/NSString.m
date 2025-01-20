@interface NSString
+ (_PASUTF8String)_pas_stringWithDataNoCopy:(uint64_t)a3 encoding:(uint64_t)a4 nullTerminated:(Boolean)a5 isExternalRepresentation:(unint64_t)a6 utf8StringThreshold:;
+ (__CFString)_pas_foundationStringNoCopyWithBufferStart:(unint64_t)a3 bufferEnd:(unint64_t)a4 encoding:(int)a5 nullTerminated:(Boolean)a6 isExternalRepresentation:(const __CFAllocator *)a7 allocator:;
@end

@implementation NSString

void __60__NSString__PASDistilledString___pas_distilledStringClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1A62450A0]();
  v1 = (void *)MEMORY[0x1A62450A0]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  v8 = (void *)_pas_distilledStringClasses__pasExprOnceResult;
  _pas_distilledStringClasses__pasExprOnceResult = v7;
}

+ (_PASUTF8String)_pas_stringWithDataNoCopy:(uint64_t)a3 encoding:(uint64_t)a4 nullTerminated:(Boolean)a5 isExternalRepresentation:(unint64_t)a6 utf8StringThreshold:
{
  id v10 = a2;
  self;
  if (!v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"data must be nonnull"];
  }
  v11 = objc_msgSend(v10, "_pas_dataWithNonnullBytes");

  unint64_t v12 = [v11 length];
  id v13 = v11;
  uint64_t v14 = [v13 bytes];
  v15 = (const char *)v14;
  if (a4 && !v12)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nullTerminated is true but the buffer is zero-length"];
LABEL_28:
    id v28 = v13;
    uint64_t v29 = self;
    if (!v15)
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInMethod:sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_backedByObject_, v29, @"NSString+_PASAdditions.m", 914, @"Invalid parameter not satisfying: %@", @"buffer" object file lineNumber description];
    }
    unint64_t v30 = (unint64_t)&v15[v12];
    if (!v28)
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_backedByObject_, v29, @"NSString+_PASAdditions.m", 915, @"Invalid parameter not satisfying: %@", @"backingObject" object file lineNumber description];
    }
    context.version = 0;
    id v31 = v28;
    context.info = v31;
    memset(&context.retain, 0, 24);
    context.allocate = (CFAllocatorAllocateCallBack)cfAllocateAlwaysFailing_1745;
    context.reallocate = 0;
    context.deallocate = (CFAllocatorDeallocateCallBack)cfDeallocateReleaseBackingObject;
    context.preferredSize = 0;
    CFAllocatorRef v32 = CFAllocatorCreate(0, &context);
    if (v32)
    {
      uint64_t v33 = v29;
      v34 = v15;
      unint64_t v35 = v30;
      unint64_t v36 = a3;
      int v37 = a4;
      Boolean v38 = a5;
      CFAllocatorRef v39 = v32;
    }
    else
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      [v44 handleFailureInMethod:sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_backedByObject_, v29, @"NSString+_PASAdditions.m", 922, @"Invalid parameter not satisfying: %@", @"deallocator" object file lineNumber description];

      uint64_t v33 = v29;
      v34 = v15;
      unint64_t v35 = v30;
      unint64_t v36 = a3;
      int v37 = a4;
      Boolean v38 = a5;
      CFAllocatorRef v39 = 0;
    }
    +[NSString _pas_foundationStringNoCopyWithBufferStart:bufferEnd:encoding:nullTerminated:isExternalRepresentation:allocator:](v33, v34, v35, v36, v37, v38, v39);
    v40 = (_PASUTF8String *)objc_claimAutoreleasedReturnValue();
    CFRelease(v32);

    goto LABEL_35;
  }
  if (a3 != 4) {
    goto LABEL_28;
  }
  if (!v12) {
    goto LABEL_28;
  }
  a3 = 4;
  if (v12 < a6 || HIDWORD(v12)) {
    goto LABEL_28;
  }
  unint64_t v16 = v12;
  v17 = (int8x16_t *)v14;
  do
  {
    v18 = v17;
    unint64_t v19 = v16;
    BOOL v20 = v16 >= 0x20;
    v16 -= 32;
    if (!v20) {
      break;
    }
    int8x16_t v21 = vorrq_s8(*v17, v17[1]);
    v17 += 2;
  }
  while ((*(void *)&vorr_s8(*(int8x8_t *)v21.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL)) & 0x8080808080808080) == 0);
  do
  {
    v22 = (uint64_t *)v18;
    unint64_t v23 = v19;
    BOOL v20 = v19 >= 0x10;
    v19 -= 16;
    if (!v20) {
      break;
    }
    ++v18;
  }
  while (((v22[1] | *v22) & 0x8080808080808080) == 0);
  do
  {
    v24 = v22;
    unint64_t v25 = v23;
    BOOL v20 = v23 >= 8;
    v23 -= 8;
    if (!v20) {
      break;
    }
    ++v22;
  }
  while ((*v24 & 0x8080808080808080) == 0);
  while (1)
  {
    unint64_t v27 = v25 - 4;
    if (v25 < 4) {
      break;
    }
    int v26 = *(_DWORD *)v24;
    v24 = (uint64_t *)((char *)v24 + 4);
    v25 -= 4;
    if ((v26 & 0x80808080) != 0)
    {
      unint64_t v25 = v27 + 4;
      v24 = (uint64_t *)((char *)v24 - 4);
      goto LABEL_25;
    }
  }
  if (!v25)
  {
    a3 = 1;
    goto LABEL_28;
  }
LABEL_25:
  a3 = 1;
  while ((*(char *)v24 & 0x80000000) == 0)
  {
    v24 = (uint64_t *)((char *)v24 + 1);
    if (!--v25) {
      goto LABEL_28;
    }
  }
  if (a4 && *(unsigned char *)(v12 + v14 - 1)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nullTerminated is true but the buffer is not null-terminated"];
  }
  v40 = [[_PASUTF8String alloc] initWithUTF8Data:v13 asciiPrefixLength:(v24 - v15) nullTerminated:a4];
LABEL_35:

  return v40;
}

+ (__CFString)_pas_foundationStringNoCopyWithBufferStart:(unint64_t)a3 bufferEnd:(unint64_t)a4 encoding:(int)a5 nullTerminated:(Boolean)a6 isExternalRepresentation:(const __CFAllocator *)a7 allocator:
{
  uint64_t v13 = self;
  if (a2)
  {
    if (a7) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_allocator_, v13, @"NSString+_PASAdditions.m", 872, @"Invalid parameter not satisfying: %@", @"buffer" object file lineNumber description];

    if (a7) {
      goto LABEL_3;
    }
  }
  BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_allocator_, v13, @"NSString+_PASAdditions.m", 873, @"Invalid parameter not satisfying: %@", @"deallocator" object file lineNumber description];

LABEL_3:
  CFStringEncoding v14 = CFStringConvertNSStringEncodingToEncoding(a4);
  if (a5)
  {
    if (!a3) {
      goto LABEL_8;
    }
    if (a3 <= (unint64_t)a2 || *(unsigned char *)(a3 - 1)) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nullTerminated is true but the buffer is not null-terminated"];
    }
    if (strnlen(a2, a3 + ~(unint64_t)a2) == a3 + ~(unint64_t)a2)
    {
LABEL_8:
      v15 = (__CFString *)CFStringCreateWithCStringNoCopy(0, a2, v14, a7);
      goto LABEL_13;
    }
    --a3;
  }
  BOOL v16 = a3 >= (unint64_t)a2;
  CFIndex v17 = a3 - (void)a2;
  if (!v16)
  {
    int8x16_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_allocator_, v13, @"NSString+_PASAdditions.m", 901, @"Invalid parameter not satisfying: %@", @"bufferEnd >= buffer" object file lineNumber description];
  }
  v15 = (__CFString *)CFStringCreateWithBytesNoCopy(0, (const UInt8 *)a2, v17, v14, a6, a7);
LABEL_13:

  return v15;
}

id __65__NSString__PASAdditions___pas_proxyArrayOfSubstringsWithRanges___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  uint64_t v4 = [v3 rangeValue];
  uint64_t v6 = objc_msgSend(v2, "substringWithRange:", v4, v5);

  return v6;
}

uint64_t __65__NSString__PASAdditions___pas_proxyArrayOfSubstringsWithRanges___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) count];
}

@end