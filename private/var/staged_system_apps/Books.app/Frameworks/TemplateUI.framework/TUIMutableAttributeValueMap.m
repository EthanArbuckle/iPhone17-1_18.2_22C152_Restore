@interface TUIMutableAttributeValueMap
- (id)copyWithZone:(_NSZone *)a3;
- (void)setValue:(const ResolvedValue *)a3 forAttribute:(unsigned __int16)a4;
@end

@implementation TUIMutableAttributeValueMap

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[TUIAttributeValueMap allocWithZone:a3];

  return [(TUIAttributeValueMap *)v3 init];
}

- (void)setValue:(const ResolvedValue *)a3 forAttribute:(unsigned __int16)a4
{
  unsigned __int16 v6 = a4;
  v7 = &v6;
  v5 = sub_354E8((uint64_t)&self->super._map, &v6, (uint64_t)&std::piecewise_construct, &v7);
  *((_DWORD *)v5 + 6) = a3->_kind;
  objc_storeStrong((id *)v5 + 4, a3->_object);
  v5[5] = a3->var0._integer;
}

@end