@interface TUIMutableAttributeSet
- (id)copyWithZone:(_NSZone *)a3;
- (void)addAttribute:(unsigned __int16)a3;
- (void)addAttributesFromArray:(id)a3;
- (void)removeAttribute:(unsigned __int16)a3;
- (void)unionSet:(id)a3;
@end

@implementation TUIMutableAttributeSet

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TUIAttributeSet allocWithZone:a3];

  return [(TUIAttributeSet *)v4 initWithOther:self];
}

- (void)addAttribute:(unsigned __int16)a3
{
  if (a3 >= 0x100u) {
    sub_8CCD0("bitset set argument out of range");
  }
  *(unint64_t *)((char *)self->super._bitset.__first_ + (((unint64_t)a3 >> 3) & 0x1FF8)) |= 1 << a3;
}

- (void)removeAttribute:(unsigned __int16)a3
{
  if (a3 >= 0x100u) {
    sub_8CCD0("bitset reset argument out of range");
  }
  *(unint64_t *)((char *)self->super._bitset.__first_ + (((unint64_t)a3 >> 3) & 0x1FF8)) &= ~(1 << a3);
}

- (void)addAttributesFromArray:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    p_bitset = &self->super._bitset;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = +[TUIAttributeRegistry attributeWithName:](TUIAttributeRegistry, "attributeWithName:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8), (void)v10);
        if (v9 >= 0x100) {
          sub_8CCD0("bitset set argument out of range");
        }
        *(unint64_t *)((char *)p_bitset->__first_ + (((unint64_t)v9 >> 3) & 0x1FF8)) |= 1 << v9;
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)unionSet:(id)a3
{
  if (a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
      self->super._bitset.__first_[i] |= *(void *)((char *)a3 + i * 8 + 8);
  }
}

@end