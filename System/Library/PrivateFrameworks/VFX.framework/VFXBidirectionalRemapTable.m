@interface VFXBidirectionalRemapTable
- (VFXBidirectionalRemapTable)init;
- (int64_t)presentationEntityFromModel:(int64_t)a3;
- (void)add:(int64_t)a3 :(int64_t)a4;
@end

@implementation VFXBidirectionalRemapTable

- (int64_t)presentationEntityFromModel:(int64_t)a3
{
  v4 = self;
  int64_t v5 = sub_1B69F45A0(a3);

  return v5;
}

- (void)add:(int64_t)a3 :(int64_t)a4
{
  v6 = self;
  sub_1B69F469C(a3, a4);
}

- (VFXBidirectionalRemapTable)init
{
  uint64_t v3 = OBJC_IVAR___VFXBidirectionalRemapTable_remapTable;
  type metadata accessor for BidirectionalRemapTable();
  v4 = (objc_class *)swift_allocObject();
  id v5 = objc_allocWithZone(MEMORY[0x1E4F28E08]);
  v6 = self;
  *((void *)v4 + 2) = objc_msgSend(v5, sel_init);
  uint64_t v7 = MEMORY[0x1E4FBC860];
  *((void *)v4 + 3) = sub_1B62FF544(MEMORY[0x1E4FBC860]);
  *((void *)v4 + 4) = sub_1B62FF544(v7);
  *(Class *)((char *)&self->super.isa + v3) = v4;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for VFXBidirectionalRemapTable();
  return [(VFXBidirectionalRemapTable *)&v9 init];
}

- (void).cxx_destruct
{
}

@end