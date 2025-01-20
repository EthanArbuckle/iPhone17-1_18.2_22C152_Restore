@interface DreamworksPurseRecord
+ (id)recordNumber:(unsigned __int8)a3 recordData:(id)a4;
+ (void)adjustRecords:(id)a3;
- (unint64_t)idSam;
- (unsigned)amount;
- (unsigned)balance;
- (unsigned)snSam;
- (unsigned)trt;
- (void)setAmount:(unsigned int)a3;
- (void)setBalance:(unsigned int)a3;
- (void)setIdSam:(unint64_t)a3;
- (void)setSnSam:(unsigned int)a3;
- (void)setTrt:(unsigned __int8)a3;
@end

@implementation DreamworksPurseRecord

+ (id)recordNumber:(unsigned __int8)a3 recordData:(id)a4
{
  uint64_t v4 = a3;
  id v5 = a4;
  v6 = objc_opt_new();
  [v6 setSfi:4];
  [v6 setNumber:v4];
  [v6 setData:v5];
  [v6 setTrt:[v5 u8:0]];
  [v6 setBalance:[v5 u32BE:2]];
  [v6 setSeqnum:[v5 u32BE:6]];
  [v6 setAmount:[v5 u32BE:10]];
  [v6 setIdSam:[v5 u64BE:14]];
  uint64_t v7 = [v5 u32BE:22];

  [v6 setSnSam:v7];

  return v6;
}

+ (void)adjustRecords:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4 >= 2)
  {
    unint64_t v5 = v4;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    for (uint64_t i = 1; i != v5; ++i)
    {
      v15[0] = v6;
      v15[1] = 3221225472;
      v15[2] = __39__DreamworksPurseRecord_adjustRecords___block_invoke;
      v15[3] = &__block_descriptor_40_e31_B16__0__DreamworksPurseRecord_8l;
      v15[4] = i;
      v8 = [v3 firstWhere:v15];
      if ([v8 trt] != 1 && objc_msgSend(v8, "trt") != 64)
      {
        int v9 = [v8 seqnum];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __39__DreamworksPurseRecord_adjustRecords___block_invoke_2;
        v12[3] = &unk_1E65AE020;
        id v13 = v8;
        int v14 = v9;
        v10 = [v3 firstWhere:v12];
        v11 = v10;
        if (v10) {
          [v10 setSeqnum:(v9 - 1)];
        }
      }
    }
  }
}

BOOL __39__DreamworksPurseRecord_adjustRecords___block_invoke(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) == [a2 number];
}

BOOL __39__DreamworksPurseRecord_adjustRecords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 number];
  BOOL v5 = [*(id *)(a1 + 32) number] + 1 == v4
    && [v3 seqnum] == *(_DWORD *)(a1 + 40);

  return v5;
}

- (unsigned)trt
{
  return self->_trt;
}

- (void)setTrt:(unsigned __int8)a3
{
  self->_trt = a3;
}

- (unsigned)balance
{
  return self->_balance;
}

- (void)setBalance:(unsigned int)a3
{
  self->_balance = a3;
}

- (unsigned)amount
{
  return self->_amount;
}

- (void)setAmount:(unsigned int)a3
{
  self->_amount = a3;
}

- (unint64_t)idSam
{
  return self->_idSam;
}

- (void)setIdSam:(unint64_t)a3
{
  self->_idSam = a3;
}

- (unsigned)snSam
{
  return self->_snSam;
}

- (void)setSnSam:(unsigned int)a3
{
  self->_snSam = a3;
}

@end