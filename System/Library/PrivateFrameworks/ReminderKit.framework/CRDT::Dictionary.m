@interface CRDT::Dictionary
@end

@implementation CRDT::Dictionary

CRDT::Dictionary_Element *__43__CRDictionary_initWithCRCoder_dictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v6 = a4;
  v7 = v6;
  if ((*(unsigned char *)(a2 + 32) & 2) != 0)
  {
    uint64_t v9 = *(void *)(a2 + 48);
    if (!v9) {
      uint64_t v9 = *(void *)(CRDT::Dictionary_Element::default_instance(v6) + 48);
    }
    v6 = [(CRDT::Dictionary_Element *)v7 decodeObjectForProtobufObjectID:v9];
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }
  *a3 = 0;
  if (*(unsigned char *)(a2 + 32))
  {
    uint64_t v10 = *(void *)(a2 + 40);
    if (!v10) {
      uint64_t v10 = *(void *)(CRDT::Dictionary_Element::default_instance(v6) + 40);
    }
    *a3 = [(CRDT::Dictionary_Element *)v7 decodeObjectForProtobufObjectID:v10];
  }

  return v8;
}

@end