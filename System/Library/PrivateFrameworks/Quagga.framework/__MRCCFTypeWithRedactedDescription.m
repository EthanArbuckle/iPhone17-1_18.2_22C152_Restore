@interface __MRCCFTypeWithRedactedDescription
- (NSString)redactedDescription;
@end

@implementation __MRCCFTypeWithRedactedDescription

- (NSString)redactedDescription
{
  unint64_t v4 = objc_msgSend__cfTypeID(self, a2, v2);
  os_unfair_lock_lock_with_options();
  if (qword_1EBFFB788 != -1) {
    dispatch_once(&qword_1EBFFB788, &unk_1F36623E8);
  }
  if (!*((void *)&xmmword_1EBFFB758 + 1)) {
    goto LABEL_20;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_1EBFFB758 + 8));
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v6 = v4;
    if (v4 >= *((void *)&xmmword_1EBFFB758 + 1)) {
      unint64_t v6 = v4 % *((void *)&xmmword_1EBFFB758 + 1);
    }
  }
  else
  {
    unint64_t v6 = (*((void *)&xmmword_1EBFFB758 + 1) - 1) & v4;
  }
  v7 = *(void **)(xmmword_1EBFFB758 + 8 * v6);
  if (v7)
  {
    v8 = (void *)*v7;
    if (*v7)
    {
      do
      {
        unint64_t v9 = v8[1];
        if (v9 == v4)
        {
          if (v8[2] == v4) {
            break;
          }
        }
        else
        {
          if (v5.u32[0] > 1uLL)
          {
            if (v9 >= *((void *)&xmmword_1EBFFB758 + 1)) {
              v9 %= *((void *)&xmmword_1EBFFB758 + 1);
            }
          }
          else
          {
            v9 &= *((void *)&xmmword_1EBFFB758 + 1) - 1;
          }
          if (v9 != v6) {
            goto LABEL_20;
          }
        }
        v8 = (void *)*v8;
      }
      while (v8);
    }
  }
  else
  {
LABEL_20:
    v8 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBFFB7F0);
  if (v8)
  {
    v14[1] = (atomic_ullong)self;
    uint64_t v11 = v8[6];
    if (!v11) {
      sub_1DC307C38();
    }
    (*(void (**)(atomic_ullong *__return_ptr))(*(void *)v11 + 48))(v14);
    v12 = (id)CFMakeCollectable((CFTypeRef)atomic_exchange(v14, 0));
    sub_1DC31FA90(v14);
    return v12;
  }
  else
  {
    return (NSString *)MEMORY[0x1F4181798](self, sel_description, v10);
  }
}

@end