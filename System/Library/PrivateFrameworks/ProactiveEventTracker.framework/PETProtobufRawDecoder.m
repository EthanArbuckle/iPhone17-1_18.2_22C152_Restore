@interface PETProtobufRawDecoder
+ (id)filterProtobufData:(id)a3 onField:(id)a4 onNestedMessageEnd:(id)a5;
+ (id)filterProtobufData:(id)a3 withWhitelist:(id)a4;
@end

@implementation PETProtobufRawDecoder

+ (id)filterProtobufData:(id)a3 withWhitelist:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  [v8 addObject:v7];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  id v9 = v7;
  id v20 = v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__PETProtobufRawDecoder_filterProtobufData_withWhitelist___block_invoke;
  v16[3] = &unk_1E56C3E78;
  v18 = v19;
  id v17 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__PETProtobufRawDecoder_filterProtobufData_withWhitelist___block_invoke_2;
  v13[3] = &unk_1E56C3EA0;
  id v10 = v17;
  id v14 = v10;
  v15 = v19;
  v11 = [a1 filterProtobufData:v6 onField:v16 onNestedMessageEnd:v13];

  _Block_object_dispose(v19, 8);

  return v11;
}

uint64_t __58__PETProtobufRawDecoder_filterProtobufData_withWhitelist___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = [NSNumber numberWithUnsignedInt:a2];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 BOOLValue])
    {
      uint64_t v8 = 1;
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  [*(id *)(a1 + 32) addObject:v7];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
  uint64_t v8 = 1;
  *a3 = 1;
LABEL_8:

  return v8;
}

uint64_t __58__PETProtobufRawDecoder_filterProtobufData_withWhitelist___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeLastObject];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) lastObject];

  return MEMORY[0x1F41817F8]();
}

+ (id)filterProtobufData:(id)a3 onField:(id)a4 onNestedMessageEnd:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = v7;
  uint64_t v11 = [v10 bytes];
  CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
  uint64_t v16 = 0;
  uint64_t v13 = objc_msgSend(v10, "length", v11);

  v15[1] = v11 + v13;
  v15[2] = v11;
  v15[3] = v11;
  v15[4] = Mutable;
  parse((uint64_t)v15, v9, v8);

  if ((_BYTE)v16)
  {
    CFRelease(Mutable);
    CFMutableDataRef Mutable = 0;
  }

  return Mutable;
}

@end